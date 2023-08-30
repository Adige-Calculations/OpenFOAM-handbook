from mpi4py import MPI

comm = MPI.COMM_WORLD
# Process rank
worker = comm.Get_rank()
# Processes rank size - per 8 processor the size will be 8
size = comm.Get_size()

print("Hello world from worker", worker, "of size", size)

## Point to point communication
