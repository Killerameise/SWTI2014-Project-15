as yet unclassified
renderSubmissionOfGroup: aGroup forAssignment: anAssignment on: html
	| submission |
	submission := anAssignment getSubmissionByGroup: aGroup.
	
	self renderGroup: aGroup on: html.
	self renderDeadlineOfAssignment: anAssignment forGroup: aGroup on: html.
	
	submission 
		ifNotNil: [submission isEmpty 
					ifFalse: [self renderZipLinkForSubmission: submission ofAssignment: anAssignment forGroup: aGroup on: html]].
	html unorderedList
			with: [anAssignment assignmentParts 
						do: [: each | self renderFileLinksOfAssignmentPart: each fromSubmission: submission on: html]]