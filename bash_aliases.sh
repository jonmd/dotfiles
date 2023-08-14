# EQ
alias eq_tunnel='cd; cd git/utils/ssh-tunnel; ./tunnel-open.sh registry.prod.eq 5000 5001'
alias eq_web2='cd; cd git/web2; workon web2; docker start eq-timescaledb2 eq-redis7'
alias eq_sources='cd; cd git/sources/projects/sources/; workon sources'
alias eq_ansible='cd; cd git/ansible/production; workon ansible'

# Hobby
alias secop='cd; cd git/diagnotize; workon diagnotize; docker start diagnotize-pg15'
