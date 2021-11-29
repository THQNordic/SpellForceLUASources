
 -- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 372.293488 , 255.328842 , 28.346745 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(242.969,164.831,31.810);]] )
   Camera:MotionSpline_AddSplinePoint( 346.486633 , 230.592484 , 23.576771 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 325.579102 , 197.281403 , 26.286749 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 313.234375 , 170.004211 , 30.896748 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 298.893555 , 151.415466 , 33.636715 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 272.634766 , 125.058998 , 37.248676 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 13.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )