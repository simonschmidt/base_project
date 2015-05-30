common_packages:
  pkg.installed:
    - names:
      - htop
      # I don't think salt can do pyvenv directly yet
      - python-virtualenv
      - python3-virtualenv
