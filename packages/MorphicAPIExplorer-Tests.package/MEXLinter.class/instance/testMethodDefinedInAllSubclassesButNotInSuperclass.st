test-for-intention-revealing
testMethodDefinedInAllSubclassesButNotInSuperclass

	self assertAllAreZero: (self runLinterRule: #smallLintMissingSubclassResponsibility)