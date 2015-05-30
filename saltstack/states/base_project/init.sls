baseuser:
  user.present:
    - fullname: 'Example base user'
    - shell: /bin/bash
    - home: /home/baseuser


base-venv:
  virtualenv.managed:
    - name: "/home/baseuser/venv"
    - python: "/usr/bin/python3"
    - requirements: "{{ pillar['project']['root'] }}/requirements.txt"
    - cwd: "{{ pillar['project']['root'] }}"
    - user: baseuser
  cmd.run:
    - name: "/home/baseuser/venv/bin/pip install -U pip setuptools"
    - user: baseuser
