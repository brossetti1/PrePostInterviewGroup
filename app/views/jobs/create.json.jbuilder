json.job do
  json.job_title @job.job_title
  json.lead_source @job.lead_source
  json.pro @job.pro
  json.con @job.con
  json.short_summary @job.short_summary
  json.salary @job.salary @
  json.company_id @job.company_id
  json.created_at @job.created_at
  json.updated_at @job.updated_at
  json.user_id @job.user_id
end