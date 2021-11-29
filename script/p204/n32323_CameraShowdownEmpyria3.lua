-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 492.241791 , 231.923904 , 24.122154 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(8791);]] )
   Camera:MotionSpline_AddSplinePoint( 492.241791 , 231.923904 , 24.122154 , 6.399996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 492.241791 , 231.923904 , 24.122154 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(534.422,245.034,20.136);]] )
   Camera:MotionSpline_AddSplinePoint( 492.241791 , 231.923904 , 24.122154 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
