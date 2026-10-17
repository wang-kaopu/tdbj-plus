import hudson.model.ParametersDefinitionProperty
import hudson.model.StringParameterDefinition
import hudson.plugins.git.BranchSpec
import hudson.plugins.git.GitSCM
import hudson.plugins.git.UserRemoteConfig
import hudson.triggers.SCMTrigger
import jenkins.model.Jenkins
import org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition
import org.jenkinsci.plugins.workflow.job.WorkflowJob

def job = Jenkins.get().getItemByFullName('tdbj-local')
assert job instanceof WorkflowJob : 'tdbj-local 必须是现有 Pipeline Job'
assert job.definition instanceof CpsScmFlowDefinition : 'tdbj-local 必须使用 Pipeline script from SCM'
assert job.definition.scriptPath == 'Jenkinsfile' : 'Jenkinsfile 路径与预期不一致'

def oldUrls = job.definition.scm.userRemoteConfigs.collect { it.url }
assert oldUrls == ['https://github.com/wang-kaopu/tdbj-plus.git'] || oldUrls == ['file:///opt/git/tdbj-plus.git'] : '现有 SCM 地址与预期不一致'

def scm = new GitSCM(
    [new UserRemoteConfig('file:///opt/git/tdbj-plus.git', null, null, null)],
    [new BranchSpec('*/master')],
    null,
    null,
    []
)
def definition = new CpsScmFlowDefinition(scm, 'Jenkinsfile')
definition.setLightweight(true)
job.setDefinition(definition)

def remainingTriggers = job.getTriggersJobProperty().getTriggers().findAll { !(it instanceof SCMTrigger) }
job.setTriggers(remainingTriggers)

def oldParameters = job.getProperty(ParametersDefinitionProperty.class)
def remainingParameters = oldParameters?.parameterDefinitions?.findAll { it.name != 'REVISION' } ?: []
if (oldParameters != null) {
    job.removeProperty(ParametersDefinitionProperty.class)
}
job.addProperty(new ParametersDefinitionProperty(remainingParameters + [new StringParameterDefinition('REVISION', '', '本次推送的完整 40 位 commit SHA；手动构建留空时使用服务器本地 master')]))
job.save()
println 'tdbj-local: SCM=file:///opt/git/tdbj-plus.git，branch=*/master，Poll SCM 已关闭，REVISION 参数已配置'
