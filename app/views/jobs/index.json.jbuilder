json.array! @jobs do |job|
	json.job_id job.id
	json.job_title job.job_title
	json.lead_source job.lead_source
	json.short_summary job.short_summary
	json.salary job.salary
	json.pros JSON.parse(job.pros.pluck(:pro).first)
	json.cons JSON.parse(job.cons.pluck(:con).first)
end