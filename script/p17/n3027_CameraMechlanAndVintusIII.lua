-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 430.591492 , 566.765259 , 210.818405 , 24.700058 , [[Camera:ScriptSplineLookAtNpc(3027);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 430.440765 , 566.104370 , 211.866699 , 18.800035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 432.672363 , 564.620483 , 211.866699 , 24.600058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 433.265594 , 563.894165 , 211.866699 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
