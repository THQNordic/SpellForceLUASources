-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 110.585381 , 162.390030 , 17.201611 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(105.082,193.281,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 116.283638 , 174.414322 , 14.451637 , 7.299995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 133.829834 , 176.255554 , 16.631655 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 144.220657 , 176.119431 , 19.097532 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
