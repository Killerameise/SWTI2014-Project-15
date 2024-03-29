| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'Salsify';
  repository: 'filetree://', gitPath, '/SWTI2014-Project-15/packages';
  get.

Metacello new
  baseline: 'Salsify';
  repository: 'filetree://', gitPath, '/SWTI2014-Project-15/packages';
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfSalsify' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
