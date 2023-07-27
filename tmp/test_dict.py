import torch
import math


class Polynomial3(torch.nn.Module):
    def __init__(self):
        """
        In the constructor we instantiate four parameters and assign them as
        member parameters.
        """
        super().__init__()
        self.a = torch.nn.Parameter(torch.randn(()))
        self.b = torch.nn.Parameter(torch.randn(()))

    def forward(self, x):
        """
        In the forward function we accept a Tensor of input data and we must return
        a Tensor of output data. We can use Modules defined in the constructor as
        well as arbitrary operators on Tensors.
        """
        return self.a + self.b * x

class AAA(Polynomial3):
    def __init__(self):
        super().__init__()
        self.c = torch.nn.Parameter(torch.randn(()))
p = Polynomial3()
print(p.__dict__)
a = AAA()
print(a.__dict__)