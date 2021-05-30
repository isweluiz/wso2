
```bash
[root@localhost ansible]# ansible-playbook  install_wso2.yml

PLAY [Install WSO2] ***********************************************************************************

TASK [Gathering Facts] ********************************************************************************
ok: [54.84.18.16]

TASK [InstallWso2 : Install Java and Wget] ************************************************************
ok: [54.84.18.16]

TASK [InstallWso2 : Create directory] *****************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Unarchive WSO2 file] **************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Download wso2 init] ***************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Download wso2 service] ************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Create user WSO2] *****************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Change permissions] ***************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Create symbolic link] *************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Get IP] ***************************************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Change IP configurations] *********************************************************
changed: [54.84.18.16]

TASK [InstallWso2 : Download wso2 motd] ***************************************************************
ok: [54.84.18.16]

TASK [InstallWso2 : Start service] ********************************************************************
changed: [54.84.18.16]

PLAY RECAP ********************************************************************************************
54.84.18.16                : ok=13   changed=10   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

Example Playbook
----------------
install_wso2.yml
---
- name: Install WSO2
  hosts: wso2
  become: true
  roles:
    - InstallWso2
...


License
-------

BSD

Author Information
------------------

https://github.com/isweluiz/
