-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 560.986511 , 219.101898 , 12.680601 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(569.777,217.952,15.235);]] )
   Camera:MotionSpline_AddSplinePoint( 559.320801 , 214.791779 , 12.680599 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 563.306458 , 210.476456 , 12.680599 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 584.613281 , 207.166946 , 12.680599 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
