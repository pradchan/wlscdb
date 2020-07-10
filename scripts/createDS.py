connect('weblogic','Oracle123!','t3://localhost:7101')
edit()
startEdit()

cd('/')
cmo.createJDBCSystemResource('spatialgraphds')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds')
cmo.setName('spatialgraphds')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCDataSourceParams/spatialgraphds')
set('JNDINames',jarray.array([String('jndi/spatialgraphds')], String))

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds')
cmo.setDatasourceType('GENERIC')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCDriverParams/spatialgraphds')
cmo.setUrl('jdbc:oracle:thin:@//localhost:1521/sgrpdb')
cmo.setDriverName('oracle.jdbc.OracleDriver')
cmo.setPassword('Oracle_4U')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCConnectionPoolParams/spatialgraphds')
cmo.setTestTableName('SQL ISVALID\r\n\r\n')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCDriverParams/spatialgraphds/Properties/spatialgraphds')
cmo.createProperty('user')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCDriverParams/spatialgraphds/Properties/spatialgraphds/Properties/user')
cmo.setValue('appspat')

cd('/JDBCSystemResources/spatialgraphds/JDBCResource/spatialgraphds/JDBCDataSourceParams/spatialgraphds')
cmo.setGlobalTransactionsProtocol('OnePhaseCommit')

cd('/JDBCSystemResources/spatialgraphds')
set('Targets',jarray.array([ObjectName('com.bea:Name=AdminServer,Type=Server')], ObjectName))

save()

activate()

exit()
