namespace ResourceTrackerApi.DTOs
{
    public class ProjectDTO
    {
        public int AccountId { get; set; } //referes to Id for the Account Table
        public int Id { get; set; } //referes to Id for the Project Table
        public string AccountName { get; set; } = string.Empty;
        public string ProjectId { get; set; } = string.Empty;
        public string ProjectName { get; set; } = string.Empty;
    }
}
