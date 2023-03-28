namespace ResourceTrackerApi.Model
{
    public class TechnicalTrack
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public int ProjectId { get; set; }
        public string CreatedDate { get; set; } = string.Empty;

    }
}
