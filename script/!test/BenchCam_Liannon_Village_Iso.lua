-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 208.824768 , 76.098473 , 41.585743 , 24.900059 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-2);]] )
   Camera:MotionSpline_AddSplinePoint( 217.120590 , 97.044525 , 41.905743 , 5.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 221.331497 , 118.135529 , 40.725742 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 229.770996 , 143.436829 , 40.665745 , 13.300014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 238.203552 , 172.680374 , 41.055752 , 18.600035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 250.717865 , 210.496521 , 42.005745 , 22.100048 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 259.156769 , 235.526566 , 41.795929 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 271.808411 , 252.254562 , 41.935745 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.742188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
