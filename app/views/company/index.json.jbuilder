json.array! @companies do |company|
	json.(company, :id, :name)
	json.jobs company.jobs do |job|
	    json.job_id job.id
		json.job_title job.job_title
		json.lead_source job.lead_source
		json.short_summary job.short_summary
		json.salary job.salary
		json.events job.events do |event|
			json.event_id event.id
			json.research event.research
			json.key_findings event.key_findings
			json.takeaways event.takeaways
			json.outcome event.outcome
			json.thankyou_note event.thankyou_note
			json.follow_up event.follow_up
			json.referral event.referral
			json.feedback event.feedback
			json.business_card event.business_card
		
		end
	end	
end






