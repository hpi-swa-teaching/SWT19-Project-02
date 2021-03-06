tests
testCategoryButtonToExplorationView

	| view openExplorationViews openOverViews |
	view := builder build: overView.
	view openInWorld.
	openExplorationViews := (self getOpenWindowsWithModel: MEXToolExplorationView) size.
	openOverViews := (self getOpenWindowsWithModel: MEXToolOverView) size.
	((view submorphs select: [:aMorph | 
		aMorph isKindOf: MEXPluggableButtonMorph])
		select: [:aMorph | aMorph label isKindOf: MEXScalableImageMorph]) first performAction.
	self assert: (self getOpenWindowsWithModel: MEXToolExplorationView) size equals: (openExplorationViews + 1).
	self assert: (self getOpenWindowsWithModel: MEXToolOverView) size equals: (openOverViews - 1).
	view abandon
