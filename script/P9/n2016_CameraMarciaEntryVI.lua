-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 445.091705 , 531.416748 , 19.531507 , 9.900002 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 462.232697 , 554.793701 , 19.811508 , 6.799996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 478.930908 , 584.957703 , 19.811508 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 488.414581 , 612.200989 , 18.382189 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.898438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
