namespace ResourceTrackerApi.Model
{
    public class Project
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public int AccountId { get; set; }
        public string ProjectId { get; set; } = string.Empty; 
        public string CreatedDate { get; set; }  = string.Empty;
    }
}
