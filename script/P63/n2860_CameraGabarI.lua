-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 575.892700 , 380.467987 , 61.322113 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(586.258,391.748,59.000);]] )
   Camera:MotionSpline_AddSplinePoint( 578.100342 , 380.186829 , 61.391914 , 7.499995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 580.309143 , 379.903564 , 61.672066 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 581.520691 , 379.620544 , 61.782104 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
