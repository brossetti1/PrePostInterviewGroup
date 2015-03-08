json.array! @jobs do |job|
	json.job_id job.id
	json.job_title job.job_title
	json.lead_source job.lead_source
	json.short_summary job.short_summary
	json.salary job.salary
	json.pros job.pros.map(&:pro)
	json.cons job.cons.map(&:con)
end