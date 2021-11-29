-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 632.997009 , 82.932007 , 25.430676 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(654.526,72.273,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 632.997009 , 82.932007 , 25.430676 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.997009 , 82.932007 , 25.430676 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.997009 , 82.932007 , 25.430676 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
