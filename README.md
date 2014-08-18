This is a tracking program for experiments, using Active Record.

Scopes, validations and a callback are implemented in the Experiment class.  There is also a validation in the Scientist class.
A many to many association is created via has_and_belongs_to_many between scientists and experiments.

The ui allows adding editing listing and deletion of scientists and experiments, and creating and listing the associations between them.
The scope can also be demonstrated via the LNS menu option, assuming that an experiment with no start time has been created first.

Author: Sean Morrison
License: Public Domain



