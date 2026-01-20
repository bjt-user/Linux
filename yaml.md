#### multiline strings

This worked in a `.gitlab-ci.yml`:
```
script:
    >
      ansible all --private-key ~/.ssh/id_ed25519_ansible
      -i "${DEPLOY_TARGET}," -m ansible.builtin.ping
```
