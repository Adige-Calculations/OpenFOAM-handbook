# controlDict

The time from where simulation starts (startFrom), the time when the
simulation finishes (stopAt), the time step (deltaT), the data saving
interval (writeInterval), the saved data file format (writeFormat), the
saved file data precision (writePrecision), and if changing the files
during the run can affect the run or not (runTimeModifiable) are set in
this file.

*Note*: If the write format is ASCII, then the simulation data which is
written to the file can be opened and read using any text editor. If the
format is binary, the data will be written in binary style and is not
readable by text editors. The advantage of binary over ASCII is the
smaller file size, and consequently faster conversion and writing to
disk, for big simulations.