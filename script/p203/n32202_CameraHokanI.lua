-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 656.236206 , 569.381409 , 9.406693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(605.595,557.420,11.910);]] )
   Camera:MotionSpline_AddSplinePoint( 656.236206 , 569.381409 , 9.406693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 656.236206 , 569.381409 , 9.406693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 656.236206 , 569.381409 , 9.406693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
