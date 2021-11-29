-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 182.496887 , 529.768860 , 12.783230 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(10101);]] )
   Camera:MotionSpline_AddSplinePoint( 182.496887 , 529.768860 , 12.783230 , 6.399996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.1);
Camera:ScriptSplineLookAtPosition(179.693,567.241,1.500);]] )
   Camera:MotionSpline_AddSplinePoint( 182.496887 , 529.768860 , 12.783230 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 182.496887 , 529.768860 , 12.783230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
