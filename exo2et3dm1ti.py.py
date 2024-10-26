#%%

######################################################## EXERCICE 2 #####################################################
import numpy as np

# Question 1

# Pour un recodage en 2

print(29/72*np.log(29/72)+43/72*np.log(43/72))
print(45/72*np.log(45/72)+27/72*np.log(27/72))
print(61/72*np.log(61/72)+11/72*np.log(11/72))
print(71/72*np.log(71/72)+1/72*np.log(1/72))

# On prend Z1


# Pour un recodage en 3

print(29/72*np.log(29/72)+16/72*np.log(16/72)+27/72*np.log(27/72))
print(29/72*np.log(29/72)+32/72*np.log(32/72)+11/72*np.log(11/72))
print(29/72*np.log(29/72)+42/72*np.log(42/72)+1/72*np.log(1/72))
print(45/72*np.log(45/72)+26/72*np.log(26/72)+1/72*np.log(1/72))
print(45/72*np.log(45/72)+16/72*np.log(16/72)+11/72*np.log(11/72))
print(61/72*np.log(61/72)+10/72*np.log(10/72)+1/72*np.log(1/72))

# On prend Z1  ([0].[0;0.5],[0.5,>3])

# %%
################################# EXERCICE 3 ##########################
import numpy as np

HX1=-(1/2*np.log(1/2)+1/2*np.log(1/2))
HX2=-(4/10*np.log(4/10)+3/10*np.log(3/10)+3/10*np.log(3/10))
HX3=-(4/10*np.log(4/10)+6/10*np.log(6/10))
HX4=-(3/10*np.log(3/10)+5/10*np.log(5/10)+2/10*np.log(2/10))


HX1X2=-(3/10*np.log(3/10)+1/10*np.log(1/10)+2/10*np.log(2/10)+1/10*np.log(1/10)+3/10*np.log(3/10))
HX1X3=-(3/10*np.log(3/10)+1/10*np.log(1/10)+2/10*np.log(2/10)+4/10*np.log(4/10))
HX1X4=-(3/10*np.log(3/10)+2/10*np.log(2/10)+3/10*np.log(3/10)+2/10*np.log(2/10))

print(HX1+HX2-HX1X2)
print(HX1+HX3-HX1X3)
print(HX1+HX4-HX1X3)
# %%

HX1=-(2/5*np.log(2/5)+3/5*np.log(3/5))
HX3=-(1/5*np.log(1/5)+4/5*np.log(4/5))
HX2=-(2/5*np.log(2/5)+2/5*np.log(2/5)+1/5*np.log(1/5))

HX1X3=-(1/5*np.log(1/5)+1/5*np.log(1/5)+3/5*np.log(3/5))
HX1X2=-(1/5*np.log(1/5)+1/5*np.log(1/5)+1/5*np.log(1/5)+1/5*np.log(1/5)+1/5*np.log(1/5))


print(HX1)
print(HX3)
print(HX1X3)

print("X1 ET X3",HX1+HX3-HX1X3)
print("X1 ET X2",HX1+HX2-HX1X2)


# %%
import numpy as np

H1= -(29/72*np.log(29/72)+43/72*np.log(43/72))
HY= -(22/72*np.log(22/72)+50/72*np.log(50/72))
H1Y= -(2/72*np.log(2/72)+27/72*np.log(27/72)+20/72*np.log(20/72)+23/72*np.log(23/72))

print(H1Y)
print(H1)
print(HY)
print(H1+HY-H1Y)
# %%
import numpy as np
HY= -(22/72*np.log(22/72)+50/72*np.log(50/72))

H2= -(45/72*np.log(45/72)+27/72*np.log(27/72))
H2Y= -(8/72*np.log(8/72)+37/72*np.log(37/72)+14/72*np.log(14/72)+13/72*np.log(13/72))

print(HY)
print(H2)
print(H2Y)
print(HY+H2-H2Y)
# %%
import numpy as np

HY= -(22/72*np.log(22/72)+50/72*np.log(50/72))

H3=-(61/72*np.log(61/72)+11/72*np.log(11/72))
H3Y=-(16/72*np.log(16/72)+45/72*np.log(45/72)+6/72*np.log(6/72)+5/72*np.log(5/72))

print(HY+H3-H3Y)
# %%
HY= -(22/72*np.log(22/72)+50/72*np.log(50/72))

H4Y=-(21/72*np.log(21/72)+50/72*np.log(50/72)+1/72*np.log(1/72))
H4=-(71/72*np.log(71/72)+1/72*np.log(1/72))

print(HY+H4-H4Y)

# %%
