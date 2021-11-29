-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 399.799988 , 657.000183 , 28.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(398.500,680.000,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 399.799988 , 657.500000 , 28.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.799988 , 658.000000 , 28.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.799988 , 658.500000 , 28.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
