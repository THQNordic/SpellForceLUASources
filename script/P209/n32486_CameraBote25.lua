-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 607.526489 , 335.502289 , 49.210716 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(571.786,354.375,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 607.526489 , 335.502289 , 49.210716 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(571.786,354.375,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 607.526489 , 335.502289 , 49.210716 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(571.786,354.375,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 607.526489 , 335.502289 , 49.210716 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(571.786,354.375,10.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
