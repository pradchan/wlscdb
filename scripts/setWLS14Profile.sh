#!/bin/sh

# WARNING: This file is created by the Configuration Purpose
# Any changes to this script may be lost when adding extensions to this configuration.

JAVA_HOME="/u01/graalvm-ee-java11-20.0.1"
export JAVA_HOME

MW_HOME="/u01/middleware/14c"
export MW_HOME

EXAMPLES_HOME="/u01/middleware/14c/wlserver/samples/server"
export EXAMPLES_HOME

MAVEN_HOME="${MW_HOME}/oracle_common/modules/thirdparty/apache-maven_bundle/3.6.1.0.0/apache-maven-3.6.1"
export MAVEN_HOME

ANT_HOME="${MW_HOME}/oracle_common/modules/thirdparty/org.apache.ant/1.10.5.0.0/apache-ant-1.10.5"
export ANT_HOME

DOMAIN_HOME="/u01/middleware/14c/user_projects/domains/wl_server"
export DOMAIN_HOME

. ${DOMAIN_HOME}/bin/setDomainEnv.sh

CLASSPATH="${CLASSPATH}${CLASSPATHSEP}/u01/middleware/14c/wlserver/samples/server/examples/build/clientclasses"
export CLASSPATH
export PATH="${ANT_HOME}/bin:${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${PATH}"

popd

echo "Classpath has successfully been set to: ${CLASSPATH}"

echo "Script has completed successfully"

