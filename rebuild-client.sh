vagrant destroy client --force
vagrant ssh master -c "sudo puppet cert clean client.local"
vagrant up client
