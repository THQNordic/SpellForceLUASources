-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 295.573730 , 312.230408 , 19.129673 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(379.588,393.579,19.010);
]] )
   Camera:MotionSpline_AddSplinePoint( 312.961365 , 322.858032 , 18.019672 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.818146 , 335.082062 , 17.279716 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 334.721863 , 350.745331 , 15.589661 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
