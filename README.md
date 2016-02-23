# ose-vnc

This project was created to support access to OpenShift instances running
remotely in the public cloud.  See https://github.com/jim-minter/aws-ose3 .

# Usage

The following steps can be used to deploy within the OpenShift environment:

* Ideally this project should be hidden from the demo user, so I recommend
  creating it using the system:admin account.  Run the following as root on the
  instance:

  ```
  oc new-project vnc
  oc new-app -n vnc --docker-image=jimminter/novnc -e HOSTPORT=$(hostname):5900
  oc expose -n vnc svc/novnc --name no
  ```

* The result should be that the NoVNC client is available at
  https://no-vnc.OPENSHIFT-APP-DOMAIN/ .

* The container runs a websockify client just like the [unmodified NoVNC
  utility](https://github.com/kanaka/noVNC), providing a websocket proxy for the
  host's VNC server listening on 5900.
