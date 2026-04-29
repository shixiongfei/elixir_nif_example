#include <erl_nif.h>

static ERL_NIF_TERM sum(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]) {
  int a, b;

  enif_get_int(env, argv[0], &a);
  enif_get_int(env, argv[1], &b);

  return enif_make_int(env, a + b);
}

static ERL_NIF_TERM echo(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]) {
  ErlNifPid pid;

  if (!enif_get_local_pid(env, argv[0], &pid)) {
    return enif_make_badarg(env);
  }

  ErlNifEnv *msg_env = enif_alloc_env();
  ERL_NIF_TERM ok = enif_make_atom(env, "ok");
  ERL_NIF_TERM content = enif_make_copy(msg_env, argv[1]);
  ERL_NIF_TERM msg_tuple = enif_make_tuple2(env, ok, content);

  if (!enif_send(NULL, &pid, msg_env, msg_tuple)) {
    enif_free_env(msg_env);
    return enif_make_atom(env, "error");
  }

  enif_free_env(msg_env);

  return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = {{"sum", 2, sum}, {"echo", 2, echo}};

ERL_NIF_INIT(Elixir.Nif, nif_funcs, NULL, NULL, NULL, NULL);
