export PGHOST=/tmp
export PGUSER=postgres

function pg_functions() {
    psql --csv -c "SELECT routine_name FROM information_schema.routines WHERE routine_type = 'FUNCTION';" | fzf
}
