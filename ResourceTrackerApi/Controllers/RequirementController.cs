using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ResourceTrackerApi.Model;
using ResourceTrackerApi.Repository;
using SqlKata.Execution;

namespace ResourceTrackerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequirementController : ControllerBase
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();
        [HttpGet]
        public IEnumerable<ResourceRequirement> Get()
        {
            IEnumerable<ResourceRequirement> requirement = null;
            try
            {
                requirement = db.Query("ResourceRequirement").Get<ResourceRequirement>();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return requirement;
        }

        [HttpGet("{id}")]
        public ResourceRequirement GetById(int id)
        {
            ResourceRequirement requirement = null;
            try
            {
                requirement = db.Query("ResourceRequirement").Where("Id", id).FirstOrDefault<ResourceRequirement>();
            }
            catch (Exception ex) { return null; }
            return requirement;
        }

        [HttpPost]
        public int Insert([FromBody] ResourceRequirement requirement)
        {
            int id;
            if (requirement.Id == 0) //Insert
            {
                try
                {
                    id = db.Query("ResourceRequirement").InsertGetId<int>(new
                    {
                        requirement = requirement.Requirement,
                        trackId = requirement.TrackId,
                        projectId = requirement.ProjectId
                    });
                }
                catch (Exception ex) { return 0; }
            }
            else  //Update
            {
                int affected = 0;
                try
                {
                    affected = db.Query("ResourceRequirement").Where("Id", requirement.Id).Update(new
                    {
                        requirement = requirement.Requirement,
                        trackId = requirement.TrackId,
                        projectId = requirement.ProjectId
                    });
                }
                catch (Exception ex) { return 0; }
                return affected;
            }
            return id;
        }
        [HttpDelete("{id}")]
        public int Delete(int id)
        {
            int deleted = 0;
            try
            {
                deleted = db.Query("ResourceRequirement").Where("Id", id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }
    }
}
