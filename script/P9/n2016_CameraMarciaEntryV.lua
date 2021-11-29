-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 318.002197 , 602.953979 , 25.863791 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(400.731,560.211,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 337.241821 , 620.903320 , 24.733791 , 6.899996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.645752 , 629.185852 , 22.693825 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.116089 , 632.025635 , 20.883791 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
