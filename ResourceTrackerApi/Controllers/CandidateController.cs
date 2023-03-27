using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ResourceTrackerApi.Model;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using ResourceTrackerApi.DTOs;
using Microsoft.AspNetCore.Http.HttpResults;
using System.Diagnostics;
using ResourceTrackerApi.Repository;
using Microsoft.AspNetCore.Routing.Matching;

namespace ResourceTrackerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CandidateController : ControllerBase
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();

        //For Filtering the candidates on front end
        [HttpGet]
        public IEnumerable<CandidateInterviewDTO> GetAll()
        {
            IEnumerable<CandidateInterviewDTO> Candidates = null;
            try
            {
                Candidates = db.Query("Candidate")
                            .Join("InterviewDetails", "Candidate.InterviewDetailsId", "InterviewDetails.id")
                            .Select("Candidate.Id", "Candidate.isInternal", "Candidate.employeeId", "Candidate.firstName", "Candidate.lastName",
                            "Candidate.email", "Candidate.mobileNumber", "Candidate.techTrackId", "Candidate.jobTitle","Candidate.Grade", "Candidate.baseLocation",
                            "Candidate.skill", "Candidate.experience", "Candidate.LWD","Candidate.InterviewDetailsId", "InterviewDetails.projectId", "InterviewDetails.InterviewType",
                            "InterviewDetails.InterviewDate", "InterviewDetails.Panel", "InterviewDetails.interviewStatus", "InterviewDetails.Remarks",
                            "Candidate.createdDate", "Candidate.updatedDate", "Candidate.updatedBy","Candidate.updateComments", "Candidate.createdBy", "Candidate.isActive").Get<CandidateInterviewDTO>();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return Candidates;
        }
        //[HttpGet("GetByFilter")] //Currently using client side filtering
        //public IEnumerable<Candidate> GetByFilter([FromBody]object filter)
        //{
        //    IEnumerable<Candidate> Candidates = null;
        //    try
        //    {
        //        Candidates = db.Query("Candidate").Where("Name", filter).Get<Candidate>();
        //    }
        //    catch (Exception ex) { }
        //    return Candidates;
        //}
        [HttpGet("{id}")]
        public CandidateInterviewDTO GetById(int id)
        {
            CandidateInterviewDTO dto = null;
            try
            {
                dto = db.Query("Candidate")
            .Join("InterviewDetails", "Candidate.InterviewDetailsId", "InterviewDetails.id")
            .Select("Candidate.Id", "Candidate.isInternal", "Candidate.employeeId", "Candidate.firstName", "Candidate.lastName",
            "Candidate.email", "Candidate.mobileNumber", "Candidate.techTrackId", "Candidate.jobTitle", "Candidate.Grade", "Candidate.baseLocation",
            "Candidate.skill", "Candidate.experience", "Candidate.LWD", "Candidate.InterviewDetailsId", "InterviewDetails.projectId", "InterviewDetails.InterviewType",
            "InterviewDetails.InterviewDate", "InterviewDetails.Panel", "InterviewDetails.interviewStatus", "InterviewDetails.Remarks",
            "Candidate.createdDate", "Candidate.updatedDate", "Candidate.updatedBy","Candidate.updateComments", "Candidate.createdBy", "Candidate.isActive").Where("Candidate.Id", id).FirstOrDefault<CandidateInterviewDTO>();
            }
            catch (Exception ex) { return null; }
            return dto;
        }

        [HttpPost]
        public int InsertOrUpdate([FromBody] CandidateInterviewDTO dto)
        {
            Mapper map = new Mapper();
            Candidate candidate = map.mapCandidateData(dto);
            InterviewDetails details =map.mapInterviewDetailsData(dto);
            
            if (candidate.LWD == "")  //this has to be done for every date field, otherwise it is putting trash values in db
                candidate.LWD = null;
            if (candidate.UpdatedDate == "")
                candidate.UpdatedDate = null;
            int id=0;
            InterviewDetailsRepo interviewRepo = new InterviewDetailsRepo();
            CandidateRepo candidateRepo= new CandidateRepo();
            if (candidate.Id == 0) //Insert
            {
                candidate.InterviewDetailsId = interviewRepo.InsertGetId(details);
                id = candidateRepo.InsertGetId(candidate);
            }
            else     //Update
            {
                int affectedrowsInterview= interviewRepo.UpdateGetAffected(details,candidate.InterviewDetailsId);
                int affectedrowsCandidate = candidateRepo.UpdateGetAffected(candidate);

                return affectedrowsCandidate + affectedrowsInterview;
            }
            return id;
        }

        [HttpDelete("{id}")]
        public int Delete(int id)
        {
            InterviewDetailsRepo interviewRepo = new InterviewDetailsRepo();
            CandidateRepo candidateRepo = new CandidateRepo();
            Candidate candidate = candidateRepo.GetById(id);
            int deletedrowsCandidate = candidateRepo.Delete(id);
            int deletedrowsInterview = 0;
            if(deletedrowsCandidate > 0)
                deletedrowsInterview = interviewRepo.Delete(candidate.InterviewDetailsId);
            
            
            return deletedrowsCandidate + deletedrowsInterview;
        }
    }
}
