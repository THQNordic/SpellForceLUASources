-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.593750 , 572.452026 , 61.782787 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(331.317,577.558,62.000);]] )
   Camera:MotionSpline_AddSplinePoint( 333.593750 , 572.452026 , 61.782787 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 333.593750 , 572.452026 , 61.782787 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 333.593750 , 572.452026 , 61.782787 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
