#!/bin/sh

# WARNING: This file is created by the Configuration Purpose
# Any changes to this script may be lost when adding extensions to this configuration.

JAVA_HOME="/bin"
export JAVA_HOME

MW_HOME="/u01/middleware/12c"
export MW_HOME

EXAMPLES_HOME="/u01/middleware/12c/wlserver/samples/server"
export EXAMPLES_HOME

DOMAIN_HOME="/u01/middleware/12c/user_projects/domains/wl_server"
export DOMAIN_HOME

. ${DOMAIN_HOME}/bin/setDomainEnv.sh

CLASSPATH="${CLASSPATH}${CLASSPATHSEP}/u01/middleware/12c/wlserver/samples/server/examples/build/clientclasses"
export CLASSPATH
export PATH="${JAVA_HOME}/bin:${PATH}"

popd

echo "Classpath has successfully been set to: ${CLASSPATH}"

echo "Script has completed successfully"

