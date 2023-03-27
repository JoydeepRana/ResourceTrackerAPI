using ResourceTrackerApi.DTOs;
using ResourceTrackerApi.Model;

namespace ResourceTrackerApi.Repository
{
    public class Mapper
    {
        public Candidate mapCandidateData(CandidateInterviewDTO dto)
        {
            Candidate candidate = new Candidate();
            candidate.Id = dto.Id;
            candidate.IsInternal = dto.IsInternal;
            candidate.EmployeeId = dto.EmployeeId;
            candidate.FirstName = dto.FirstName;
            candidate.LastName = dto.LastName;
            candidate.Email = dto.Email;
            candidate.MobileNumber = dto.MobileNumber;
            candidate.TechTrackId = dto.TechTrackId;
            candidate.JobTitle = dto.JobTitle;
            candidate.Grade = dto.Grade;
            candidate.BaseLocation = dto.BaseLocation;
            candidate.Skill = dto.Skill;
            candidate.Experience = dto.Experience;
            candidate.LWD = dto.LWD;
            candidate.InterviewDetailsId = dto.InterviewDetailsId;
            candidate.CreatedBy = dto.CreatedBy;
            candidate.UpdatedDate = dto.UpdatedDate;
            candidate.UpdatedBy = dto.UpdatedBy;
            candidate.UpdateComments = dto.UpdateComments;
            return candidate;
        }

        public InterviewDetails mapInterviewDetailsData(CandidateInterviewDTO dto)
        {
            InterviewDetails details= new InterviewDetails();
            details.ProjectId = dto.ProjectId;
            details.InterviewType = dto.InterviewType;
            details.InterviewDate = dto.InterviewDate;
            details.Panel = dto.Panel;
            details.InterviewStatus = dto.InterviewStatus;
            details.Remarks = dto.Remarks;
            details.CreatedBy = dto.CreatedBy;
            return details;
        }

        public Project mapProjectData(ProjectDTO dto)
        {
            Project project = new Project();
            project.ProjectId = dto.ProjectId;
            project.Name = dto.ProjectName;
            project.Id = dto.Id;
            project.AccountId= dto.AccountId;

            return project;
        }

        public Account mapAccountData(ProjectDTO dto)
        {
            Account account = new Account();
            account.Name = dto.AccountName;

            return account;
        }
    }
}
