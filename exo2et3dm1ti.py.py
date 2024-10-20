#%%

######################################################## EXERCICE 2 #####################################################
import numpy as np

# Question 1

# Pour un recodage en 2

print(29/72*np.log2(29/72)+43/72*np.log2(43/72))
print(45/72*np.log2(45/72)+27/72*np.log2(27/72))
print(61/72*np.log2(61/72)+11/72*np.log2(11/72))
print(71/72*np.log2(71/72)+1/72*np.log2(1/72))

# On prend Z1


# Pour un recodage en 3

print(29/72*np.log2(29/72)+16/72*np.log2(16/72)+27/72*np.log2(27/72))
print(29/72*np.log2(29/72)+32/72*np.log2(32/72)+11/72*np.log2(11/72))
print(29/72*np.log2(29/72)+42/72*np.log2(42/72)+1/72*np.log2(1/72))
print(45/72*np.log2(45/72)+26/72*np.log2(26/72)+1/72*np.log2(1/72))
print(45/72*np.log2(45/72)+16/72*np.log2(16/72)+11/72*np.log2(11/72))
print(61/72*np.log2(61/72)+10/72*np.log2(10/72)+1/72*np.log2(1/72))

# On prend Z1  ([0].[0;0.5],[0.5,>3])

# %%
################################# EXERCICE 3 ##########################
import numpy as np

I12= 0.3*np.log(0.3/0.2)+0.2*np.log(0.2/0.15)+0.1*np.log(0.1/0.2)+0.1*np.log(0.1/0.15)+0.3*np.log(0.3/0.15)
I13= 0.3*np.log(0.3/0.2)+0.1*np.log(0.1/0.2)+0.2*np.log(0.2/0.3)+0.4*np.log(0.4/0.3)
I14= 0.3*np.log(0.3/(3/20))+0.2*np.log(0.2/(5/20))+0.3*np.log(0.3/(5/20))+0.2*np.log(0.2/0.1)
I23= 0.1*np.log(0.1/(12/100))+0.3*np.log(0.3/(16/100))+0.2*np.log(0.2/(18/100))+0.1*np.log(0.1/(24/100))+0.3*np.log(0.3/(18/100))
I24= 0.1*np.log(0.1/(15/100))+0.2*np.log(0.2/(6/100))+0.2*np.log(0.2/(12/100))+0.2*np.log(0.2/(20/100))+0.1*np.log(0.1/(9/100))+0.2*np.log(0.2/(15/100))
I34= 0.2*np.log(0.2/(12/100))+0.1*np.log(0.1/(20/100))+0.1*np.log(0.1/(8/100))+0.1*np.log(0.1/(18/100))+0.4*np.log(0.4/(30/100))+0.1*np.log(0.1/(12/100))

a= I12 + I13 + I14
b= I12 + I23 + I24
c= I13 + I23 + I34
d= I14 + I24 + I34

print(I12)
print(I13)
print(I14)
print(I23)
print(I24)
print(I34)

print(a,b,c,d)

# X2 est le plus grand donc on le garde




# %%
############### EXERCICE 3 via autre formule

X1=-(1/2*np.log(1/2)+1/2*np.log(1/2))
X2=-(0.3*np.log(0.3)+0.4*np.log(0.4)+0.3*np.log(0.3))
X3=-(4/10*np.log(4/10)+6/10*np.log(6/10))

X1X2 = -(0.3*np.log(0.3)+0.3*np.log(0.3)+0.1*np.log(0.1)+0.2*np.log(0.2)+0.1*np.log(0.1))
X1X3=-(3/10*np.log(3/10)+2/10*np.log(2/10)+0.1*np.log(0.1)+0.4*np.log(0.4))

IX1X2= X1 + X2 - X1X2
IX1X3= X1 + X3 -X1X3

print(IX1X2)
print(IX1X3)
# %%

######################## Exercice 3 avec chapeau pointu turlututu
import numpy as np

X1=-(1*np.log(1))
X3=-(1/3*np.log(1/3)+2/3*np.log(2/3))
X4=-(5)

X1X3=-(1/3*np.log(1/3)+2/3*np.log(2/3))

IX1X3=X1+X3-X1X3

print(IX1X3)

####### Pour chapo arondi

Y1=-(3/4*np.log(3/4)+1/4*np.log(1/4))
Y2=-(3/4*np.log(3/4)+1/4*np.log(1/4))
Y3=-(1/2*np.log(1/2)+1/2*np.log(1/2))

Y1Y2=-(3/4*np.log(3/4)+1/4*np.log(1/4))
Y1Y3=-(1/2*np.log(1/2)+1/4*np.log(1/4)+1/4*np.log(1/4))

IY1Y2=Y1+Y2-Y1Y2
IY1Y3=Y1 + Y3 - Y1Y3

print(IY1Y2)
print(IY1Y3)
# %%
