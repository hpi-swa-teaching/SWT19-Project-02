event handling
mouseUp: anEvent

	| clickedMorph highlightedMorph |
	clickedMorph := self itemFromPoint: anEvent position.
	highlightedMorph := self valueOfProperty: #highlightedMorph ifAbsent: [].
	self removeProperty: #highlightedMorph.

	((model okToChange not
			or: [clickedMorph isNil])
			or: [clickedMorph ~~ highlightedMorph])
		ifTrue: [
			highlightedMorph ifNotNil: [:m | m highlightForMouseDown: false].
			^ self
		].

	"Changes here"
	(clickedMorph complexContents parent isNil)
		ifFalse: [
			(self selectedMorphs anySatisfy: [:morph | clickedMorph == morph])
				ifTrue: [self setSelectedMorphs: (self selectedMorphs remove: clickedMorph; yourself)]
				ifFalse: [self setSelectedMorphs: (self selectedMorphs add: clickedMorph; yourself)].
		]
		ifTrue: ["ignore parents for now"].

	"do we need this ?
	((autoDeselect isNil or: [autoDeselect])
	ifTrue: [self setSelectedMorphs: nil]
	ifFalse: [self setSelectedMorphs: (self selectedMorphs add: clickedMorph; yourself)]."
	""
	highlightedMorph highlightForMouseDown: false.
	anEvent hand newKeyboardFocus: self.
	Cursor normal show.