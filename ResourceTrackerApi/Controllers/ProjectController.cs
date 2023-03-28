using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ResourceTrackerApi.DTOs;
using ResourceTrackerApi.Model;
using ResourceTrackerApi.Repository;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();

        [HttpGet]
        public IEnumerable<ProjectDTO> GetAll()
        {
            IEnumerable<ProjectDTO> dto = null;
            try
            {
                dto = db.Query("Project")
                            .Join("Account", "Project.AccountId", "Account.Id")
                            .Select("Project.Id", "Project.ProjectCode", "Project.projectName", "Project.AccountId", "Account.accountName").Get<ProjectDTO>();
            }
            catch (Exception ex){ return null; }
            return dto;
        }

        [HttpGet("{id}")]
        public ProjectDTO GetById(int id)
        {
            ProjectDTO dto = null;
            try
            {
                dto = db.Query("Project")
                            .Join("Account", "Project.AccountId", "Account.Id")
                            .Select("Project.Id", "Project.ProjectCode", "Project.projectName", "Project.AccountId", "Account.accountName").Where("Project.Id", id).FirstOrDefault<ProjectDTO>();
            }
            catch (Exception ex) { return null; }
            return dto;
        }

        [HttpPost]
        public int InsertorUpdate([FromBody] ProjectDTO dto)
        {
            Mapper mapper= new Mapper();
            Account account = mapper.mapAccountData(dto);
            Project project = mapper.mapProjectData(dto);

            AccountRepo accountRepo= new AccountRepo();
            ProjectRepo projectRepo = new ProjectRepo();
            int id = 0;
            if (project.Id == 0) //Insert
            {
                project.AccountId = accountRepo.InsertGetId(account);
                id = projectRepo.InsertGetId(project);
            }
            else //Update
            {
                int affectedrowsAccount = accountRepo.UpdateGetAffected(account, project.AccountId);
                int affectedrowsProject = projectRepo.UpdateGetAffected(project);
                return affectedrowsAccount + affectedrowsProject;
            }
            return id;
        }

        [HttpDelete("{id}")]
        public int Delete(int id)
        {
            AccountRepo accountRepo = new AccountRepo();
            ProjectRepo candidateRepo = new ProjectRepo();
            Project project = candidateRepo.GetById(id);
            int deletedrowsProject = candidateRepo.Delete(id);
            int deletedrowsAccount = 0;
            if(deletedrowsProject > 0)
                deletedrowsAccount = accountRepo.Delete(project.AccountId);


            return deletedrowsAccount + deletedrowsProject;
        }
    }
}
