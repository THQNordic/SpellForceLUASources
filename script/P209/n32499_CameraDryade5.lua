-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 576.924805 , 355.353424 , 5.835055 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(574.795,357.456,5.700);]] )
   Camera:MotionSpline_AddSplinePoint( 576.924805 , 355.353424 , 5.835055 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(574.795,357.456,5.700);]] )
   Camera:MotionSpline_AddSplinePoint( 576.924805 , 355.353424 , 5.835055 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(574.795,357.456,5.700);]] )
   Camera:MotionSpline_AddSplinePoint( 576.924805 , 355.353424 , 5.835055 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(574.795,357.456,5.700);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
