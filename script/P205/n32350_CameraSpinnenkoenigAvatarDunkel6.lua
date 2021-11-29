-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 168.743423 , 431.998993 , 23.405361 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 172.822815 , 432.505951 , 23.415359 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 176.666183 , 433.950928 , 23.415363 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 180.761520 , 436.890747 , 23.425365 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 185.717255 , 445.843414 , 23.425365 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 189.933350 , 455.185089 , 23.445354 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
