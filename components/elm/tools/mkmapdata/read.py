import netCDF4
import numpy as np
import matplotlib.pyplot as plt

#dset = netCDF4.Dataset('/compyfs/d3m045/test/LowerMiss/matlab_for_clipping/surfdata_LowerMiss_625x900_grid_c220316_orig.nc')
dset = netCDF4.Dataset('map_0.5x0.5_AVHRR_to_LowerMiss_625x900_nomask_aave_da_c220324.nc')
nx = 625
ny = 900
mask = dset['mask_b'][:].reshape(ny,nx)
#PCT_NAT_PFT = 100, PCT_CROP = 0, PCT_LAKE = 0, PCT_WETLAND = 0, PCT_URBAN = 0, PCT_GLACIER = 0,  URBAN_REGION_ID=0
plt.imshow(mask,origin='lower')#,extent=[np.min(x.flatten()),np.max(x.flatten()),np.min(y.flatten()),np.max(y.flatten())],origin='lower')
plt.show()

