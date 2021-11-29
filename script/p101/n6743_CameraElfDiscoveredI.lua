-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 312.814789 , 568.804260 , 36.276497 , 59.799660 , [[Camera:ScriptSplineLookAtPosition(324.841,583.248,20.620);]] )
   Camera:MotionSpline_AddSplinePoint( 316.412323 , 563.689880 , 36.581821 , 39.999962 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 322.161102 , 558.536499 , 37.176491 , 59.699661 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 328.842682 , 556.958862 , 37.076500 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
